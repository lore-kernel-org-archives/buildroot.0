From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:07:11 +0100
Subject: [Buildroot] [PATCH/next 5/6] package/belr: new package
In-Reply-To: <20200227174714.3727844-5-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
 <20200227174714.3727844-5-fontaine.fabrice@gmail.com>
Message-ID: <20200309220711.79b2494c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 18:47:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Belr is Belledonne Communications' language recognition library, written
> in C++11. It parses text inputs formatted according to a language
> defined by an ABNF grammar, such as the protocols standardized at IETF.
> 
> https://gitlab.linphone.org/BC/public/belr
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/belr/Config.in | 19 +++++++++++++++++++
>  package/belr/belr.hash |  3 +++
>  package/belr/belr.mk   | 26 ++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/belr/Config.in
>  create mode 100644 package/belr/belr.hash
>  create mode 100644 package/belr/belr.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
