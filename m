From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 24 Apr 2019 07:51:56 -0500
Subject: [Buildroot] [PATCH v3] package/nfs-utils: making nfs server
 optional
In-Reply-To: <1556098414-13394-1-git-send-email-angelo@amarulasolutions.com>
References: <1556098414-13394-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <CANQCQpYZcJgLr+_dW2=U00SRQ=h02hRtuv-aQjDXm-3xor1Mhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Wed, Apr 24, 2019 at 4:34 AM Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
>
> This patch makes nfs server component optional. This is useful when
> only client tools are used and the full nfs server is not needed.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Agree this would be nice to be able to toggle.  We usually end up
having a post build script remove a list of items like this.

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
