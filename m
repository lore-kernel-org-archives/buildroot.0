From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 00:21:58 +0200
Subject: [Buildroot] [PATCH v2 1/3] libglib2: bump to version 2.40.0
In-Reply-To: <1403214158-16862-2-git-send-email-hadrien.boutteville@gmail.com>
References: <1403214158-16862-1-git-send-email-hadrien.boutteville@gmail.com>
 <1403214158-16862-2-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <53A4B406.9060802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/06/14 23:42, Hadrien Boutteville wrote:
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It would be better if you explicitly mention the removed patch in the commit
message.

> ---
> Changes v1 -> v2:
>   - add comments to patches inside Buildroot (Thomas De S.)
> ---
>  ...ror-format-string-errors-from-mismatched-.patch | 56 ----------------------
>  package/libglib2/libglib2-0002-no-gtk-doc.patch    | 25 ++++++++++
>  package/libglib2/libglib2.mk                       |  4 +-
>  3 files changed, 27 insertions(+), 58 deletions(-)
>  delete mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
>  create mode 100644 package/libglib2/libglib2-0002-no-gtk-doc.patch
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
