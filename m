From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Oct 2017 10:59:07 +0200
Subject: [Buildroot] [PATCH] dump1090: new package
In-Reply-To: <CANCHnQo6Z=53Nq9JPEDnnjTE0BvN6PsjT2MM35oAc5_M88eaGg@mail.gmail.com>
 (Jeroen Roovers's message of "Wed, 4 Oct 2017 09:44:12 +0200")
References: <20170930183842.17954-1-peter@korsgaard.com>
 <CANCHnQo6Z=53Nq9JPEDnnjTE0BvN6PsjT2MM35oAc5_M88eaGg@mail.gmail.com>
Message-ID: <87r2uj9tlw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeroen" == Jeroen Roovers <jer@airfi.aero> writes:

 >      Hi,
 > On 30 September 2017 at 20:38, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 >> +         https://github.com/MalcolmRobb/dump1090

 >> +DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))

 > Interesting. I have been using https://github.com/antirez/dump1090
 > instead. Did you have a particular reason to choose this fork?

Yes, I hessitated as well. The reason why I went with MalcolmRobb's
version (that is explictly referenced from the antirez readme) was:

- Support for finding data files elsewhere than . (/usr/share/dump1090)

- Extra viewer program, making it easier to run as a service in the
  background

- More advanced web interface

-- 
Bye, Peter Korsgaard
