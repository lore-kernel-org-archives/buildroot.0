From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Oct 2018 23:35:55 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <c7c0d90d-a25e-7832-67c4-4aa3598691fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/18 17:48, Thomas Petazzoni wrote:
>>          arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/2bdbb93e6404943e59791773106d8b2680211886 |     
> luvi 2.8.0 fails to build. Bernd, you bumped this package, and J?rg
> suggested to revert the bump. Could you discuss this, and provide a fix?
> 

 I think luv is missing a dependency on lua-compat53.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
