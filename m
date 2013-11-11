From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Nov 2013 23:04:50 +0100
Subject: [Buildroot] [PATCH] gcc: don't patch gcc if there are no
	patches to apply
In-Reply-To: <87d2m661nc.fsf@dell.be.48ers.dk>
References: <1384180596-15125-1-git-send-email-mjonker@synopsys.com>
 <87d2m661nc.fsf@dell.be.48ers.dk>
Message-ID: <52815482.4010802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/13 22:59, Peter Korsgaard wrote:
>>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:
>
>> While the generic package handler checks for a directory with patches
>> before starting apply-patches.sh, this is not the case for gcc: the
>> script is called, even if there is no directory with patches. This results
>> into a build failure, as apply-patches exits with error code 1 if the
>> directory doesn't exist.
>
> Arnout already posted another patch solving the same issue, but I prefer
> this one for 2013.11 - So committed, thanks.

  Should I refresh my patch on top of this or do you want to drop my patch?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
