From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 18:11:31 +0200
Subject: [Buildroot] [PATCH] utils/get-developers: add -e flag to only
 list email addresses for git send-email
In-Reply-To: <20181008074333.1582-1-peter@korsgaard.com>
References: <20181008074333.1582-1-peter@korsgaard.com>
Message-ID: <ee5ec68a-e6df-0bb2-662e-81c7d8c7ac7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

On 8/10/18 09:43, Peter Korsgaard wrote:
[snip]
> With this and a suitable git configuration:
> 
> git config sendemail.to buildroot at buildroot.org
> git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"
> 
> You can simply do:
> 
> git send-email master
> 
> To automatically mail the buildroot list and CC affected developers on
> patches.

 Could you add this fragment to docs/manual/contribute.txt as well?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
