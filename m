From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 4 Oct 2017 09:44:12 +0200
Subject: [Buildroot] [PATCH] dump1090: new package
In-Reply-To: <20170930183842.17954-1-peter@korsgaard.com>
References: <20170930183842.17954-1-peter@korsgaard.com>
Message-ID: <CANCHnQo6Z=53Nq9JPEDnnjTE0BvN6PsjT2MM35oAc5_M88eaGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

     Hi,

On 30 September 2017 at 20:38, Peter Korsgaard <peter@korsgaard.com> wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

> +         https://github.com/MalcolmRobb/dump1090

> +DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))

Interesting. I have been using https://github.com/antirez/dump1090
instead. Did you have a particular reason to choose this fork?


Kind regards,
     jer
