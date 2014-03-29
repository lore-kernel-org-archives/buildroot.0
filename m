From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 16:55:56 +0100
Subject: [Buildroot] [PATCH v4 1/2] boost: make build with python an
 option
In-Reply-To: <1394440729-27664-1-git-send-email-johan.derycke@barco.com>
References: <1394440729-27664-1-git-send-email-johan.derycke@barco.com>
Message-ID: <20140329165556.52fcdac5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Derycke,

On Mon, 10 Mar 2014 09:38:48 +0100, Johan Derycke wrote:
> Add an option to boost to build the Boost.Python library.
> http://www.boost.org/doc/libs/1_55_0/libs/python/doc/index.html
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> ---
> Changes v3 -> v4:
>   -Avoid line-wrap using "git send-email" with gmail
>   -Fix builds with python3
> Changes v2 -> v3:
>   -Avoid line-wrap using "git send-email"
> Changes v1 -> v2:
>   -Fixed indentations and blank lines
>   -Removed package/Config.in
>   -Allow build with python3
> 
>  package/boost/Config.in |    4 ++++
>  package/boost/boost.mk  |   20 ++++++++++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
