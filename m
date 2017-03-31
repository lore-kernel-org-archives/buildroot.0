From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 31 Mar 2017 12:16:11 +0530
Subject: [Buildroot] [PATCH 00/21] Use SPDX short identifier for license
	string
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <CAEtHCKnXja-aVjZ6B98yyZKHdgvYgpW6DADQ3TFBN1Uy7ZHZZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 30, 2017 at 7:13 PM, Rahul Bedarkar
<rahulbedarkar89@gmail.com> wrote:
> This patch series aims at using SPDX short identifier as a license
> string for most widely used licenses.
>
> First patch updates documentation to refer to SPDX License List and
> removes current license abbreviations list. Next patches update
> license string in .mk file of packages. In almost all cases, update
> is done using sed command which is mentioned in corresponding patch.
> Finally scancpan and scanpypi scripts are updated to use SPDX short
> identifier.
>
> There might be some licenses, which are rarely used, are not yet
> updated to use SPDX short identifier considering this as a initial
> step to start using SPDX identifier.
>
> Rahul Bedarkar (21):
>   docs/manual: refer to SPDX License List
>   package: use SPDX short identifier for GPLv1/GPLv1+
>   boot, linux, package: use SPDX short identifier for GPLv2/GPLv2+

I received email from buildroot-owner at busybox.net that PATCH 03/21 is being
held until the list moderator can review it for approval because message size is
too big.

Thanks,
Rahul
