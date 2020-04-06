import ctypes

#A TESTER SUR UN WINDOWS 7

def wallpaper():
    SPI_SETDESKWALLPAPER = 20
    ctypes.windll.user32.SystemParametersInfoA(SPI_SETDESKWALLPAPER, 0, "images/image.jpg" , 0)
