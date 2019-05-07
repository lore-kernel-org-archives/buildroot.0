From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 01:17:17 +0200
Subject: [Buildroot] [PATCH v1 01/28] package/assimp: replace utf-8
 quote by ascii single quote
In-Reply-To: <87v9ymkmgh.fsf@dell.be.48ers.dk>
References: <20190507203548.10337-1-ps.report@gmx.net>
 <20190507225224.6cde6018@windsurf> <87v9ymkmgh.fsf@dell.be.48ers.dk>
Message-ID: <d3226f64-aa3e-ebd0-a5fb-082f901eda38@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2019 23:02, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > Hello Peter,
>  > On Tue,  7 May 2019 22:35:21 +0200
>  > Peter Seiderer <ps.report@gmx.net> wrote:
> 
>  >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  >> ---
>  >> package/assimp/assimp.mk | 2 +-
>  >> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > Thanks for all those patches. I think it would be useful to extend the
>  > check-package logic to check that such UTF-8 quotes/spaces don't get
>  > re-added.
> 
> Agreed!

 I think in Config.in, *.mk and *.hash we should never need any non-ascii
character, so that check would be easy.

 In patches, there may be non-ascii characters in the From, Sob and other tags,
and in the patch contents itself. So that will be tricky to check.

 Regards,
 Arnout
