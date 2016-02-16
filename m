From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2016 23:35:07 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
 package/Makefile.in so it exists globally.
In-Reply-To: <20160216213554.60f53246@free-electrons.com>
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
 <20160216213554.60f53246@free-electrons.com>
Message-ID: <56C3A41B.7070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alvaro,

 In addition to Thomas's comments, please use your full name in the
Signed-off-by line.

On 16-02-16 21:35, Thomas Petazzoni wrote:
> Hello,
> 
> The title is too long, it should be:
> 
> 	Makefile: declare SED globally
> 
> or something like that.
> 
> On Tue, 16 Feb 2016 16:15:26 +0100, Alvaro G. M wrote:
>> In particular, this allows the use of buildroot-submodule and in general,
>> any use of buildroot from out of tree.
> 
> This commit log should be improved, because:
> 
>  1/ Why should we care about buildroot-submodule, and if we care, what
>     is the actual problem ?
> 
>  2/ What do you mean by "use Buildroot from out of tree" ? I do out of
>     tree builds every day and it works just fine. So this aspect needs
>     to be detailed.
> 
> I have nothing against the change, which is fairly simple, but it needs
> to be justified properly.

 I suspect we're not going to like the justification :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
