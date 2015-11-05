From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 22:00:28 +0100
Subject: [Buildroot] [PATCH v2 1/3] gpsd: correct explicit nmea 0183
 support flag
In-Reply-To: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151105220028.5e69cb29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  5 Nov 2015 13:41:52 -0500, James Knight wrote:
> The following handles the GPSd SCons change for the explicit
> configuration of the NMEA 0183 protocol. The protocol configuration
> change was introduced in 3.12. Developer's who transitioned to
> Buildroot's GPSd 3.15 had NMEA 0183 implicitly enabled by default. This
> change allows NMEA 0183 to be explicitly disabled again.
> 
> See:
>  http://git.savannah.gnu.org/cgit/gpsd.git/commit/SConstruct?id=8f20d7b2d1ece8f3205ca038726c77daa5234c0c
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>   - None.
> ---
>  package/gpsd/gpsd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
