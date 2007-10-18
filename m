From: Steven Woody <narkewoody@gmail.com>
Date: Thu, 18 Oct 2007 09:11:00 +0800
Subject: [Buildroot] an error in make ( no .config under kernel directory )
Message-ID: <ed4892840710171811k6210e59cn2bb089a8ec21c297@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the buildroot is the subversion version in Oct 14.

when doing make, i got

...
cp -dpRf package/config/buildroot-config
/home/src/buildroot/project_build_arm/M501/buildroot-config
cp -dpf  /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
...

and, i go to dl/M501/linux-2.6.22.10 directory and found no .config
file.  what's wrong here?  the linux-2.6.10 kernel was downloaded in
another computer and was put in dl directory.


thanks.

-- 
woody

then sun rose thinly from the sea and the old man could see the other
boats, low on the water and well in toward the shore, spread out
across the current.
