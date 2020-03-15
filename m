From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:47:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/libcpprestsdk: needs locale
In-Reply-To: <20200314222027.2317520-2-fontaine.fabrice@gmail.com>
References: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
 <20200314222027.2317520-2-fontaine.fabrice@gmail.com>
Message-ID: <20200315224756.22ae0776@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 23:20:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> locale_t is unconditionally used since version 2.3.0 and
> https://github.com/microsoft/cpprestsdk/commit/814caa4c0a80ef223535446a274146bf46a5ef2b
> 
> Fixes:
>  - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
