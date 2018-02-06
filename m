From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Feb 2018 23:18:27 +0100
Subject: [Buildroot] [PATCH] setools: set package include path
In-Reply-To: <1517954045-19326-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1517954045-19326-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbqzJGfYitu560+3CjX8BfXB3gA2x+pQ1AbtM316-dJwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Feb 6, 2018 at 10:54 PM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> With per-package host/staging, the setuptools include path will
> point at the python package's include folder and not the common
> sysroot/hostdir location.  So this patch updates to explicitly
> point at the respective folder for the target vs host.
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Superseded by:
https://patchwork.ozlabs.org/patch/870133/
