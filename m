From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 31 Jul 2012 12:34:53 +0200
Subject: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
In-Reply-To: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>
References: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>
Message-ID: <CAAXf6LUXNqAHCCLkkNDRO8AA79fzpp9xmQhBDZJWBXF0aNae5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jul 31, 2012 at 12:24 PM, Steve Goldberg
<indeliblesteve@hotmail.com> wrote:
> I'm putting together a TI toolchain package but as some of the required
> packages are export controlled I need to host them on my institutional
> machine to control access.  I think scp is the best choice for this but the
> scp scheme does not prompt for passwords and users who haven't setup
> public-key ssh access are unable to download the packages.  Why does the
> DOWNLOAD_SCP scheme not prompt the user for a password?

In my test, using scp as primary site, it does ask for a password if
one is required.
How have you configured the package? Have you specified a user?

Have you tried running scp manually? Is a password requested there? Is
the same command used as Buildroot does?

Best regards,
Thomas
