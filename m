From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 11:16:03 +0000
Subject: [Buildroot] [PATCH 08/30] ethtool: fix license info variable
In-Reply-To: <1352804764-24026-8-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
 <1352804764-24026-8-git-send-email-arnout@mind.be>
Message-ID: <CAHt8ZCNYLfvU1959ZtJbAJcwzy5V4KjWrqc8UR2W-8Cwc=KVbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 November 2012 11:05, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> -ETHTOOL_LICENSE_FILE = COPYING
> +ETHTOOL_LICENSE_FILES = COPYING

I submitted a patch already to make this change, so:

Acked-by: Simon Dawson <spdawson@gmail.com>
