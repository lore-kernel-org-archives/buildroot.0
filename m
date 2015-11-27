From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 Nov 2015 14:04:04 +0000
Subject: [Buildroot] [PATCH] mongrel2: disable polarssl assembly as we
 do in the polarssl package
In-Reply-To: <1448632468-45374-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448632468-45374-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <565862D4.50105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 27/11/15 13:54, Vicente Olivert Riera wrote:
> mongrel2 bundles polarssl so it has the same problem as the polarssl
> with the assembly optimization, so let's use the same solution here.

could you please add this autobuilder reference when you apply it?

http://autobuild.buildroot.net/results/a92292a1defd441938d3de6c5049473d520ebc4e/

Thanks,

Vincent.
