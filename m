From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Nov 2016 15:46:12 +0000
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0-P1 (security)
In-Reply-To: <20161102163642.251b80aa@free-electrons.com>
References: <20161102142941.2769-1-Vincent.Riera@imgtec.com>
 <20161102163642.251b80aa@free-electrons.com>
Message-ID: <5149de66-db01-87a6-6ddc-c1ca11a5583d@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/11/16 15:36, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 2 Nov 2016 14:29:41 +0000, Vicente Olivert Riera wrote:
>> List of fixed CVEs:
>>
>> CVE-2016-8864
>>
>> Release notes:
>>
>> http://ftp.isc.org/isc/bind9/9.11.0-P1/RELEASE-NOTES-bind-9.11.0-P1.html
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> This patch has already been sent by Gustavo earlier today.

Oh, true. Sorry I didn't see it.

Gustavo's patch has a small issue: he forgot to update the URL of the
.asc file used to verify the tarball (in the bind.hash file).

Please consider amending his patch when applying.

Thanks,

Vincent

> Thomas
> 
