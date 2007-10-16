From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 16 Oct 2007 11:00:23 +0800
Subject: [Buildroot] `make source' cannot resume
Message-ID: <ed4892840710152000r786d9095sb7af7d14d14957ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

after the downloading process of `make source' broken by some reasons,
i then restarted it by reissued the same command.  what i expected is
that those already downloaded will be skipped, and the `make source'
continue to download those not yet grabbed.  but the truth is not.
`make source' restarted the whole download process from the beginning
and to download everything that has already existed in the `dl'
directory.

i know this problem may has something to do with the system i am using
( it's cygwin and because i met some problem setting the network of my
linux box, i have to do the `make source' on cygwin now ).  but i got
no more clues.

ps. another suspicous is the the downloading directory, dl, is not
located correctly in cygwin.  i am in ~/buildroot and the $HOME is
/e/woody,  but the `make source' insisted to put everything it grabbed
in a directory /e/e/woody/buildroot/dl ( please note the second `e' in
the path name').  it's so weird

-- 
woody

then sun rose thinly from the sea and the old man could see the other
boats, low on the water and well in toward the shore, spread out
across the current.
