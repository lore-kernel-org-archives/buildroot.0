From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 17:56:08 +0100
Subject: [Buildroot] [PATCH v3 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <56115A28.9020001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-04-15 01:45, Emeric Vigier wrote:
> If you had some files added to the targetfs (fs-overlay, new packages,
> ...) and you no longer need them, buildroot does not offer a simple way
> to remove these items from the output/target directory. The rule added
> by this commit allows you to clean the targetfs. Issuing 'make'
> afterward will generate a new and clean targetfs.
> 
> A section in the documentation is also added. It describes few examples
> when developers could need it. 'make help' is also updated accordingly.
> And full-rebuild section of the documentation is updated with content
> and links.
> 
> Change-Id: I42b640e845bb4195fb7b160281b16ee40883f01f
> Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>

 Hi Emeric,

 Since there were some comments on this patch and there also seem to be cases
where it doesn't really work well, I've marked it as Changes Requested in our
patch tracking system. So unless you resubmit a new version that fixes the
comments, we will forget about your contribution.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
