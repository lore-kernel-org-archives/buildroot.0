From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Nov 2016 09:19:03 -0300
Subject: [Buildroot] [PATCH next] wireshark: bump version to 2.2.2
In-Reply-To: <20161117105816.28484-1-Vincent.Riera@imgtec.com>
References: <20161117105816.28484-1-Vincent.Riera@imgtec.com>
Message-ID: <581f8f78d4929e4ac974ec9f092fd51b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-17 07:58, Vicente Olivert Riera wrote:

> Release notes:
>   https://www.wireshark.org/docs/relnotes/wireshark-2.2.2.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Hi Vicente.
s/next/master/ since it's security as well, sorry :-)
Wireshark normally has their own internal security IDs (WNPAs) which may 
later on get matching CVEs (or not).
Regards.
