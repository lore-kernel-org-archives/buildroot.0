From: Martin Hicks <mort@bork.org>
Date: Fri, 11 Mar 2011 14:34:41 -0500
Subject: [Buildroot] Samba build problem
Message-ID: <AANLkTinF_No7g1_N7cVDbwiyc7D+uRtkgW5HkG3crnsT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When I recently merged the 2011-02 changes into my tree samba started
to fail to compile.  Has anyone else seen this?  I did look into the
git logs and it seems like the LIBTOOL patch and a recent CVE are the
only things that have touched package/samba lately.


checking for __open64... yes
checking for creat64... yes
checking for prctl... yes
configure: error: in
`/home/mort/src/buildroot/output/build/samba-3.3.14/source':
configure: error: cannot run test program while cross compiling
See `config.log' for more details.
make: *** [/home/mort/src/buildroot/output/build/samba-3.3.14/.stamp_configured]
Error 1
mort at chinook:~/src/buildroot$


-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
