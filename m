From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 18 Nov 2016 02:50:36 -0200
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
References: <f616926e-7b5c-6928-3b4c-89dfe1613374@mind.be>
Message-ID: <582e889cc9946_18903fa97a91132051065@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Nov 17, 2016 at 08:43 PM, Arnout Vandecappelle wrote:

> On 17-11-16 00:14, Max Filippov wrote:
>> On Wed, Nov 16, 2016 at 2:48 PM, Ricardo Martincoski
>> <ricardo.martincoski@gmail.com> wrote:
>>> Do you see the issue described below? Maybe I am doing something wrong.
>>> What bash version do you have in your RHEL5 servers?
>> 
>> Yes, I have this issue. It was introduced by the commit 20cd49738781b ("core:
>> add support for multiple br2-external trees").
> 
>  Would any of you RHEL5 users be able to contribute an autobuilder instance so
> this kind of issue can be detected on time?

I sent the e-mail as a heads up to the real users of RHEL5.
From past e-mails, I know Thomas DS and Max are (or were) users.

For me it's only a VM I sporadically use for tests only.
I installed bash v4 and resumed my testings.

Just trying to help. Sorry any confusion.

Regards,
Ricardo
