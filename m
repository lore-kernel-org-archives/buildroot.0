From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Apr 2016 22:23:35 +0200
Subject: [Buildroot] [PATCH] linux: use zImage by default on ARM
In-Reply-To: <5702D130.5090502@mind.be> (Arnout Vandecappelle's message of
 "Mon, 4 Apr 2016 22:40:16 +0200")
References: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAJJ6jxu=KscT+V-fAiqo16E673tnk7Zo2j+=OaVqicQYQ4YVUg@mail.gmail.com>
 <5702D130.5090502@mind.be>
Message-ID: <8737qzst2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Is this a good idea? Doesn't this break external configs that use
 >> uImage? Changing a default is a serious change.

 >  A defconfig is not very reliable when updating buildroot, because
 > defaults may change. When updating buildroot, you should use a full
 > config. This also tells you which options are new for example.

In general we do try to not change the default value of choice options
(except for version selection), but yeah, there's no guarantees.

-- 
Bye, Peter Korsgaard
