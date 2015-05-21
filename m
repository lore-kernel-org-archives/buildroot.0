From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:52:11 +0200
Subject: [Buildroot] [PATCH v2 1/5] kconfig-package: add support for
 config fragments
In-Reply-To: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150521235211.6c4f7b24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Tue, 28 Apr 2015 16:34:31 +0200, Floris Bos wrote:
> Adds functionality to the kconfig infrastructure to merge additional
> configuration fragment files to the main configuration file of
> kconfig packages, using support/kconfig/merge_config.sh
> 
> Typical use-case is when you want your configuration to be
> kept in sync with an upstream (def)config file, but do require
> some minor local modifications.
> 
> Disables -update-config and -update-defconfig targets when
> fragment files are set.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> 
> ---
> v2:

Entire series applied to the next branch!

On the first patch, I've fixed the minor issues pointed by Arnout:

    [Thomas: take into account comments made by Arnout:
      - Minor fixes in the documentation changes
      - Add @ before the tests done in the $(1)-update-config and
        $(1)-update-defconfig targets.]

Thanks a lot for your work on this topic!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
