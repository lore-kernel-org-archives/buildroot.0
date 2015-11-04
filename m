From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Nov 2015 23:51:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: fix a typo
In-Reply-To: <20151104214949.70e20041@free-electrons.com>
References: <1446662767-15730-1-git-send-email-nrubinstein@aldebaran.com>
 <20151104214949.70e20041@free-electrons.com>
Message-ID: <563A8BD7.6030602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-11-15 21:49, Thomas Petazzoni wrote:
> Dear No? Rubinstein,
> 
> On Wed,  4 Nov 2015 19:46:06 +0100, No? Rubinstein wrote:
>> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
>> ---
>>  package/nginx/nginx.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Both patches applied, thanks!
> 
> For the second patch, it would be good if someone could modify makedevs
> to not accept user/group specified as strings, since resolving them
> from the host point of view doesn't make any sense.

 Or better yet, use the target passwd and group files...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
