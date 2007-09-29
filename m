From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 30 Sep 2007 02:05:32 +0300
Subject: [Buildroot] undefined reference to `bcopy' - what's changed?
In-Reply-To: <46FED376.9050804@promwad.com>
References: <46FE7D34.6090703@promwad.com>
	<20070929162659.GP20951@aon.at>	<46FECBEA.6060005@promwad.com>
	<20070929213129.GV20951@aon.at> <46FED376.9050804@promwad.com>
Message-ID: <46FEDA3C.3020701@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan Kuten ?????:
> Bernhard Fischer ?????:
>> On Sun, Sep 30, 2007 at 01:04:26AM +0300, Ivan Kuten wrote:
>>> Bernhard Fischer ??????????:
>>> Please apply fix:
>>> package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-bcopy-replacement.patch
>> Merged. Please also push this to the "x11r7/xlib_libXfont" people
>> upstream..
> 

src/builtins/file.c  2007-09-13 Tilman Sauerbeck Replaced one instance of bcopy() with memcpy().

It's already done in their git:
http://gitweb.freedesktop.org/?p=xorg/lib/libXfont.git;a=history;h=a46b0a65e5ab5e298bde02443eae149051883933;hb=5bf703700ee4a5d6eae20da07cb7a29369667aef;f=src/builtins/file.c

Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
