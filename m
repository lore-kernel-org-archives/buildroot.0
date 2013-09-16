From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 23:17:52 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916200135.1724084e@skate> (Thomas Petazzoni's message of
 "Mon, 16 Sep 2013 20:01:35 +0200")
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate>
Message-ID: <87mwncfou7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Sure. But in Buildroot, things are more complicated: within Buildroot
 Thomas> *itself* there may be parts that you have to redistribute (i.e package
 Thomas> recipes for GPL programs), and some other parts you may not be willing
 Thomas> to redistribute (i.e package recipes for your own applications, or your
 Thomas> root filesystem overlay). This makes it quite difficult for a company
 Thomas> using Buildroot to easily separate what must be distributed from what
 Thomas> shouldn't be distributed.

I can only speak of personal experience, naturally (and you get to work
with a lot more companies than I do), but I haven't seen this as a big
problem. These things typically don't contain many "secrets".

People basically have 2 options:

- Integrate their changes in the Buildroot tree and gain the advantages
  of Buildroot

- Or keep it seperate (E.G add the stuff outside buildroot) and be able
  to keep it secret.

-- 
Bye, Peter Korsgaard
