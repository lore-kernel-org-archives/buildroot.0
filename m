From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 23:28:47 +0100
Subject: [Buildroot] [PATCH v2 09/18] erlang-p1-stringprep: bump to
 version 1.0.0
In-Reply-To: <1454443064-14269-10-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-10-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220232847.6dacfb09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:35 -0500, Frank Hunleth wrote:
> This version includes C++ code, so also add dependency on a C++
> compiler.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang-p1-stringprep/Config.in               | 4 ++++
>  package/erlang-p1-stringprep/erlang-p1-stringprep.mk | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Applied to next, but after doing the following changes:

    [Thomas:
     - propagate new C++ dependency to ejabberd, as noticed by
       Romain Naour
     - fix license information and license files. Not all the code is
       under the TCL license, in fact most of the code is under the
       Apache-2.0 license, and some additional license files have been
       added to clarify this.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
