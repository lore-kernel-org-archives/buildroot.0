From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 16:16:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] rapidxml: new package
In-Reply-To: <1438749983-25600-1-git-send-email-yba@tkos.co.il>
References: <1438749983-25600-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150817161659.54a1187c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Wed,  5 Aug 2015 07:46:23 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/Config.in              |    1 +
>  package/rapidxml/Config.in     |   11 +++++++++++
>  package/rapidxml/rapidxml.hash |    1 +
>  package/rapidxml/rapidxml.mk   |   26 ++++++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/rapidxml/Config.in
>  create mode 100644 package/rapidxml/rapidxml.hash
>  create mode 100644 package/rapidxml/rapidxml.mk

Applied, after doing a number of changes:

    [Thomas:
      - Rewrap Config.in help text
      - Indicate that the SHA256 hash has been locally calculated, and add
        the MD5 and SHA1 hashes from SourceForge.
      - Use downloads.sourceforge.net as the download site instead of
        garr.dl.sourceforge.net, in order to use the SourceForge mirrors
        properly, and be consistent with all other Buildroot packages
        downloading stuff from SourceForge.
      - Change the license from "MIT" to "Boost Software License 1.0 or
        MIT" as indicated by the license.txt file.
      - Change the <pkg>_EXTRACT_CMDS to remove the sub-directory created
        by the .zip file extraction, and simplify the staging installation
        step accordingly.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
