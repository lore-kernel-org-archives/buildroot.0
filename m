From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Tue, 6 Oct 2009 13:27:29 +0530
Subject: [Buildroot] make problem
Message-ID: <630286c70910060057g70cd6bdr9f319fde3accaad8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Using buildroot git  version.

Trying to compile for at91sam9263ek SBC.

compilation breaking off  with:-

# These are in /lib, so...
#rm -rf /home/nataraj/buildroot/output/target/usr/lib/libgcc_s*.so*
touch -c /home/nataraj/buildroot/output/target/usr/bin/gcc
cp -dpf /home/nataraj/buildroot/output/build/ncurses-5.6/lib/libncurses.so*
/home/nataraj/buildroot/output/target/usr/lib/
cp -dpf /home/nataraj/buildroot/output/build/ncurses-5.6/lib/libpanel.so*
/home/nataraj/buildroot/output/target/usr/lib/
cp -dpf /home/nataraj/buildroot/output/build/ncurses-5.6/lib/libform.so*
/home/nataraj/buildroot/output/target/usr/lib/
cp -dpf /home/nataraj/buildroot/output/build/ncurses-5.6/lib/libmenu.so*
/home/nataraj/buildroot/output/target/usr/lib/
ln -snf /usr/share/terminfo
/home/nataraj/buildroot/output/target/usr/lib/terminfo
mkdir -p /home/nataraj/buildroot/output/target/usr/share/terminfo/x
cp -dpf /home/nataraj/buildroot/output/build/staging_dir/usr/share/terminfo/x/xterm
/home/nataraj/buildroot/output/target/usr/share/terminfo/x
cp: cannot stat
`/home/nataraj/buildroot/output/build/staging_dir/usr/share/terminfo/x/xterm':
No such file or directory
make: *** [/home/nataraj/buildroot/output/target/usr/lib/libncurses.so.5.6]
Error 1


How can I fix this issue?

regards

Nataraj
