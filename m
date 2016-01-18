From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 16:32:11 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix for linux 4.4
In-Reply-To: <CACeaM88ZeuF0LRH5GbtRpZsJsNA3Mw0MCiU2yuCcyJKQugBaGg@mail.gmail.com>
 (Gerhard Heift's message of "Sat, 16 Jan 2016 15:13:56 +0100")
References: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name>
 <87pox2yb5g.fsf@dell.be.48ers.dk>
 <CACeaM89dURUrB7frSMgMLg+tvbqM4YVwpaZiwLNHnm5=Kh=7nQ@mail.gmail.com>
 <20160116141440.0924b24b@free-electrons.com>
 <CACeaM88ZeuF0LRH5GbtRpZsJsNA3Mw0MCiU2yuCcyJKQugBaGg@mail.gmail.com>
Message-ID: <87egde7vk4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gerhard" == Gerhard Heift <gerhard@heift.name> writes:

Hi,

>> Are you sure the problem is not fixed by
 >> http://git.denx.de/?p=u-boot.git;a=commit;h=69bf2d2fafe64349be3c3ef1256e3c68f812bb25,
 >> which was merged as part of 2016.01 ? The problem description looks
 >> really similar.

 > You are correct. I only looked for patches after the release of linux
 > 4.4 and missed that one.
 > So bumping u-boot-tools to 2016.01 works for me.

Ok, good. I've committed a version bump and marked this patch as
rejected.

-- 
Venlig hilsen,
Peter Korsgaard 
