From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Aug 2016 09:46:06 +0100
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160805185432.301e6a00@free-electrons.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <e6aa4d6c-3325-0f39-96b0-eb25db6a8574@gmail.com>
 <20160805185432.301e6a00@free-electrons.com>
Message-ID: <d835e1f1-1e63-2baf-6230-940225d4c650@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 05/08/16 17:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 5 Aug 2016 07:33:15 -0700, Khem Raj wrote:
> 
>>>  # Locally calculated after checking pgp signature (glibc)
>>>  sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
>>>  sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
>>> +sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.23.tar.xz  
>>
>> typo. It should be 2.24
> 
> Right. And this means that the patch was not even built-tested, as
> Buildroot bails out when there is a .hash file for a package, but no
> hash matching the file that has been downloaded.

not true. The patch was build tested, but before sending the patch to
the ML I modified the hash file, because what I did was to remove the
tabs in that file and change them by white spaces in the three lines. At
the end I decided to just make the minimal modifications, that's why
"checkout --"'ed that file and modified it again, forgetting to change
the filename.

Regards,

Vincent.

> 
> Thomas
> 
