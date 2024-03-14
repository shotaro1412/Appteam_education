import time

def format_time(seconds):
    minutes = seconds // 60
    hours = minutes // 60
    return f"{int(hours):02}:{int(minutes):02}:{seconds:.2f}"

start_time = None
last_lap_time = 0  
lap_times = []

while True:
    print("\n1: スタート\n2: ストップ\n3: ラップ\n4: スプリット\n5: 終了")
    choice = int(input("ボタンを押して: "))

    # スタート
    if choice == 1:
        if start_time is None:
            start_time = time.time()
            print("スタートしました")
        else:
            print("もうスタートしています")

    # ストップ
    elif choice == 2:
        if start_time is not None:
            elapsed_time = time.time() - start_time
            print(f"ストップ: {format_time(elapsed_time)}")
            start_time = None
            last_lap_time = 0  # ストップ時に前回のラップからの経過時間をリセット
        else:
            print("まだスタートしていません。")

    # ラップ
    elif choice == 3:
        if start_time is not None:
            current_time = time.time()
            if lap_times:
                last_lap_time = current_time - lap_times[-1]
                print(f"ラップ: {format_time(last_lap_time)}")

            lap_times.append(current_time) #lap_times[N]を記録
        else:
            print("まだスタートしていません。")

    # スプリット
    elif choice == 4:
        if start_time is not None:
            split_time = time.time() - start_time
            print(f"スプリット: {format_time(split_time)}")
        else:
            print("まだスタートしていません。")

    # プログラムの終了
    elif choice == 5:
        print("プログラムを終了します。")
        break
