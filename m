From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Jul 2013 11:01:29 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <20130728155156.1bc37ffd@skate>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar> <20130728151418.70891325@skate>
 <51F51EBE.4000701@zacarias.com.ar> <20130728155156.1bc37ffd@skate>
Message-ID: <51F52439.4060001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/2013 10:51 AM, Thomas Petazzoni wrote:

>> For mdev that can be solved, at worst it'll be an (almost) no-op,
>> devtmpfs is another story.
> 
> That's true.

It basically boils down to helping people or not on alternate scenarios.
Some random guy in #pandaboard was having issues loading firmware on a
prebuilt kernel (which sometimes happens to be a sore PITA to build a
working kernel with some vendors/for some people, no point in arguing
that no matter how much we wish everything were upstreamed/vanilla) for
WiFi support and (obviously) mdev wasn't working.
Solution was get your kernel source/config right, or fix the script.
The script was a quick way out without bad side effects.
On a personal level i don't care about the patch, it was just a quick
and painless way of fixing a common problem.
Regards.
