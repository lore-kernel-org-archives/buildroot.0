From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Nov 2016 11:20:33 +0000
Subject: [Buildroot] [PATCH] PHP: bump to 7.0.13
In-Reply-To: <d2740430-f645-4e4c-86aa-4cce32ed7ec4@zacarias.com.ar>
References: <20161116092744.7827-1-ishitatsuyuki@gmail.com>
 <38121FAB319C3344930C920E7B518313886B225E@HHMAIL01.hh.imgtec.org>
 <d2740430-f645-4e4c-86aa-4cce32ed7ec4@zacarias.com.ar>
Message-ID: <a6b022c9-ff4c-2774-acfa-2436fcaf0de4@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 16/11/16 11:12, Gustavo Zacarias wrote:
> On 16/11/16 06:38, Vincent Olivert Riera wrote:
> 
>> Hello Tatsuyuki,
>>
>> php has been already bumped to 7.0.13 in the next branch:
>>
>> https://git.busybox.net/buildroot/commit/?h=next&id=cd59cb6b388d00865d0084e6a25eb306c0b5fdd3
>>
>>
>> Is there any reason to bump it for master as well? If so, please tell
>> us and if the reason is valid a maintainer will cherry-pick the patch
>> from the next branch.
>>
>> Regards,
>>
>> Vincent.
> 
> Hi Vincent.
> It's a security release, you gotta read the ChangeLog more often:
> http://www.php.net/ChangeLog-7.php#7.0.13
> They usually don't wait for CVE assignments or ask for them after the
> release, hence no references in it.
> Sometimes looking at the oss-security mailing lists helps.

I remember I searched for "CVE" in the ChangeLog and there wasn't any
match, that's why I didn't specified it was a security update. They must
changed that page later in order to add the CVE references.

Vincent


> Regards.
