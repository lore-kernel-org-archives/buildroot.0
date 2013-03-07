From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Thu, 07 Mar 2013 08:00:53 +0200
Subject: [Buildroot] [PATCH 13/34] qt5base: new package
In-Reply-To: <1362601396-32250-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51382D15.40206@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas!

On 03/06/2013 10:22 PM, Thomas Petazzoni wrote:
> +# qt5base
> +#
> +#############################################################
> +
> +QT5BASE_VERSION = 5.0.0

  Why not 5.0.1, which was rolled out quite quickly after 5.0.0
with fixes for many bugs? Please see

  http://blog.qt.digia.com/blog/2013/01/31/qt-5-0-1-released/

and e.g.

  https://qt.gitorious.org/qt/qtbase/blobs/release/dist/changes-5.0.1

for some details.

--
Best regards,
  Alexander Lukichev
 
