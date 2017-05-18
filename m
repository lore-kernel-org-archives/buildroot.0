From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 May 2017 18:23:47 +0200
Subject: [Buildroot] ~/buildroot/packages
In-Reply-To: <CACo+m-trSpHVnX6ccbqQM+1x1FSfBWSj39C8Nk2+961VCT3hLQ@mail.gmail.com>
 (moi moi's message of "Thu, 18 May 2017 17:08:42 +0200")
References: <CACo+m-trSpHVnX6ccbqQM+1x1FSfBWSj39C8Nk2+961VCT3hLQ@mail.gmail.com>
Message-ID: <87ziea2kx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "moi" == moi moi <shmrcoffee800@gmail.com> writes:

 > Is it normal behaviour of buildroot to populate the packages folder with
 > 40+MBs of various .mk and .in files? Does buildroot copy packages from the
 > host system? I have run menuconfig once but have not buildt a system with
 > make. There are even folder for opencv and fetchmail there (which are
 > present on my host system). I run Debian 8.7.

Well, not populate as in Buildroot generating this data - But yes, these
files are part of Buildroot. This is the meta data describing how to
build the 2000+ packages available in Buildroot.

Please have a look at the manual for details:

https://buildroot.org/downloads/manual/manual.html

-- 
Bye, Peter Korsgaard
