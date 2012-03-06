From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Mar 2012 12:21:49 -0300
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
In-Reply-To: <20120305051937.GA26631@sapphire.tkos.co.il>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
 <20120301053726.GA4978@sapphire.tkos.co.il>
 <20120301153201.58f81290@gmail.com> <20120301181031.GA3915@tarshish>
 <20120303211338.14fe3545@gmail.com>
 <20120305051937.GA26631@sapphire.tkos.co.il>
Message-ID: <aec9f3a8647a9c4dc92936a966175458@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-05 02:19, Baruch Siach wrote:

> Hi Ismael,
>
> On Sat, Mar 03, 2012 at 09:13:38PM -0200, Ismael Luceno wrote:
>> On Thu, 1 Mar 2012 20:10:32 +0200
>> Baruch Siach <baruch@tkos.co.il> wrote:
>> > Doesn't the patch from r183512 fix this bug?
>>
>> What is "r183512" supposed to mean?
>
> This the Subversion commit mentioned in comment #20 of Bugzilla bug 
> #48308
> that you linked to 
> (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308).
> Comment #21 seems to indicate that this fix hasn't been backported to 
> gcc
> 4.6.x. Maybe a better solutions would be to add this patch 
> Buildroot's
> internal gcc.
>
> baruch

+1 on fixing gcc, there's no business in touching openssl and possibly 
breaking it on some other scenario because of this.
Regards.
