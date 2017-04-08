From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:27:45 +0200
Subject: [Buildroot] [PATCH v1] qt5declarative: fix examples compile
 without qt widgets module
In-Reply-To: <20170407183954.23928-1-ps.report@gmx.net>
References: <20170407183954.23928-1-ps.report@gmx.net>
Message-ID: <20170408152745.46a6f928@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Apr 2017 20:39:54 +0200, Peter Seiderer wrote:
> Fixes:
> 
>   .../qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
>   Project ERROR: Unknown module(s) in QT: widgets
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...xamples-photoviewer-needs-widgets-support.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/qt5/qt5declarative/0001-examples-photoviewer-needs-widgets-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
