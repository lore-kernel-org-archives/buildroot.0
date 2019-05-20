From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 20 May 2019 09:39:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux: xenomai: allow URL for the
 ADEOS/IPIPE patch
In-Reply-To: <20190520093132.501097d3@windsurf>
References: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
 <20190518220632.312f98da@windsurf> <20190519091707.GB4569@scaer>
 <d4035039-6dfe-046b-48da-fa323489e5fa@armadeus.com>
 <20190520093132.501097d3@windsurf>
Message-ID: <6c2931b6-1e28-2827-5c05-0ff01dceea06@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 5/20/19 9:31 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 May 2019 09:29:55 +0200
> S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:
> 
>> I don't understand what you mean with "it is scrubbed", sorry.
>> With the file:// scheme, Buildroot will try to download the patch with
>> wget and fail, that's why I filter the file:// scheme out.
> 
> Not with your latest version. With your latest version, you add the
> patch URL to EXTRA_DOWNLOADS only if it contains http://, https:// or
> ftp://. So if it's a plain path, like /home/foo/bar, it certainly won't
> try to download it.

Yes... I need more coffee ;)

Regards,

> 
> Thomas
> 


-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
