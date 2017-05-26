From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 26 May 2017 08:17:37 -0500
Subject: [Buildroot] [PATCH v4 3/3] refpolicy: add ability to set
	default state.
In-Reply-To: <20170520204143.18154-3-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
 <20170520204143.18154-3-Adamduskett@outlook.com>
Message-ID: <CANQCQpb+Q4s1rVntYedzWfZYzN66H8z6A9O7934VDpFiadA1nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Sat, May 20, 2017 at 3:41 PM, Adam Duskett <aduskett@gmail.com> wrote:
> SELinux requires a config file in /etc/selinux which controls the state
> of SELinux on the system.
>
> This config file has two options set in it:
> SELINUX which set's the state of selinux on boot.
> SELINUXTYPE which should equal the name of the policy.  In this case, the
> default name is targeted.
>
> This patch adds:
> - A choice menu on Config.in that allows the user to select a default
>   SELinux state.
>
> - A basic config file that will be installed to
>   target/etc/selinux and will set SELINUX= to the selected state.
>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Acked-by: Matt Weber  <matthew.weber@rockwellcollins.com>
