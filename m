From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:19:06 +0100
Subject: [Buildroot] [PATCH v3,
 1/2] gupnp-av: fix static library linking with gupnp
In-Reply-To: <20171031083933.19956-1-fontaine.fabrice@gmail.com>
References: <20171031083933.19956-1-fontaine.fabrice@gmail.com>
Message-ID: <20171127221906.7086b1d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 09:39:32 +0100, Fabrice Fontaine wrote:
> gupnp and gupnp-av defines two internal functions with the same name:
> xml_util_get_element and xml_util_get_child_element_content, as a result
> an application such as rygel can't be build statically.
> To fix this issue, rename both functions as
> xml_util_get_element2 and xml_util_get_child_element_content2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Romain Naour and Thomas Petazzoni):
>  - Update version from 0.34 to 0.36
>  - Remove comment on missing COPYING.logo and add it to LICENSE_FILES
>  - Add entry in DEVELOPERS
>  - Fix static build by patching gupnp-av

Applied to next, thanks. Could you please submit the patch upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
