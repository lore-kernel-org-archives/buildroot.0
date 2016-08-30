From: Manuel =?UTF-8?B?R3Jvw58=?= <mgr@nordkrater.de>
Date: Tue, 30 Aug 2016 10:36:07 +0200
Subject: [Buildroot] Question regarding support/kconfig
In-Reply-To: <20160830101545.19fee5f8@jenova>
References: <20160830101545.19fee5f8@jenova>
Message-ID: <20160830103607.0607237b@jenova>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the noise, I should have waited a little longer before asking
this question.

On Tue, 30 Aug 2016 10:15:45 +0200
Manuel Gro? <mgr@nordkrater.de> wrote:

> I want to use the support/kconfig/merge_config.sh script outside
> buildroot to merge buildroot config fragments. To do so, I need the
> script to recognise options beginning with 'BR2_' instead of
> 'CONFIG_'. I noticed a patch for the script lying around
> (patches/01-kconfig-kernel-to-buildroot.patch), which contains exactly
> those modifications.

I got confused about those patches, sorry. There is no patch for the
merge_config.sh whatsoever.
 
> Now to my question(s):
> Am I supposed to apply these patches outside buildroot, or is there
> another, proper way to patch the script?

Since there is no patch for the merge-script, and the other ones are
already applied, this question solves itself.

> Am I breaking anything by patching the script?

I obviously would break the 'pkg-kconfig' package, which uses this
script for other packages. I also imagine kernel builds using fragments
would suffer from this.
-- 
Gr??e/Regards
Manuel Gro?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 801 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160830/76eb2238/attachment.asc>
