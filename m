From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Dec 2013 08:18:08 +0100
Subject: [Buildroot] [PATCHv7 0/5] Keeping customizations outside the
 Buildroot tree with BR2_EXTERNAL
In-Reply-To: <8738m39f1y.fsf@dell.be.48ers.dk>
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <8738m39f1y.fsf@dell.be.48ers.dk>
Message-ID: <52A6C030.5040504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/13 23:02, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>   > Hello,
>   > Here is the seventh version of the BR2_EXTERNAL patch series. Its main
>   > purpose is to take into account the feedback received recently on the
>   > list.
>
>   > People interested in testing this can find a branch at
>   > http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=things-outside-br-v7.
>
> Committed series, thanks everyone!

  Perhaps we should introduce an autobuilder or jenkins instance that has 
BR2_EXTERNAL set to include some helloworld application? Then we make 
sure that this code (which will not often be used by the core BR 
developers) will still work in the future.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
