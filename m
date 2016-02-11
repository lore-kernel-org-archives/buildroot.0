From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 11 Feb 2016 17:29:01 +0100
Subject: [Buildroot] [PATCH v3] board: Add support for Acmesystems
	Arietta g25
In-Reply-To: <87pow3qkle.fsf@dell.be.48ers.dk>
References: <1454695720-24583-1-git-send-email-angelo.compagnucci@gmail.com>
 <CA+TH9Vm79Lfi-EH577iDvmnbg2P2vNFV=AwHe6KLSnxcn1Y-EA@mail.gmail.com>
 <87pow3qkle.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9Vnas0vcaDj8Thep-9f9ypMpS+6orSDCYYaMR8dhq5rZFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard

2016-02-11 17:26 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > Dear Thomas Petazzoni, Peter Korsgaard,
>  > No way to have it included at this point in time, right?
>
> Strictly no, but it cannot really cause regressions for anything else so
> I'll takke a look tonight.
>
> What is the relation between "Arietta g25" and our existing "Aria g25"?
> Do we need seperate defconfigs / board support for both?

They have the same cpu but are different boards and have differet
bootloader / memory configurations. So yes, we need support for both.

Sincerely, Angelo.

>
> --
> Venlig hilsen,
> Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
