From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 5 Dec 2017 10:41:43 +0100
Subject: [Buildroot] [PATCH v3] tcfagent: new package
In-Reply-To: <20171204120912.9850-1-nolange79@gmail.com>
References: <20171204114306.28242-1-nolange79@gmail.com>
 <20171204120912.9850-1-nolange79@gmail.com>
Message-ID: <20171205094143.GA4275@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Mon, Dec 04, 2017 at 01:09:12PM +0100, Norbert Lange wrote:
> From: Norbert Lange <norbert.lange@andritz.com>
> 
> Add tcfpackage which contains a service "tcf-agent"
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> Changes v2 -> v3:
>   - fix: init file still started the tool daemonized
>   - use same email for all signatures
> 
> Changes v1 -> v2:
>   - added myself to DEVELOPERS
>   - fixes to the init service, now uses common sheme to
>     generate PID files
>   - fixed systemd unit
>   - renamed target executable directly in CMakeList
>   - allow cmake build without existing C++ compiler
>   - add patches to make sources compile with musl
>   - allow compilation with other architectures than x86_64
>   - some more small details suggested by Thomas Petazzoni
> 

It would be nice if you can create an account on
patchwork and mark the former version as Superseded when submitting a
new version.

Thanks,

Best regards
Marcus Folkesson
