From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Fri, 18 Nov 2016 12:19:08 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <582e889cc9946_18903fa97a91132051065@ultri3.mail>
References: <f616926e-7b5c-6928-3b4c-89dfe1613374@mind.be>
 <582e889cc9946_18903fa97a91132051065@ultri3.mail>
Message-ID: <CAAXf6LVEBYOL0fcm=KTDYpnGyhWQkQ5UUgF5i6_nXka+O-0xAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Fri, Nov 18, 2016 at 5:50 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Arnout,
>
> On Thu, Nov 17, 2016 at 08:43 PM, Arnout Vandecappelle wrote:
>
>> On 17-11-16 00:14, Max Filippov wrote:
>>> On Wed, Nov 16, 2016 at 2:48 PM, Ricardo Martincoski
>>> <ricardo.martincoski@gmail.com> wrote:
>>>> Do you see the issue described below? Maybe I am doing something wrong.
>>>> What bash version do you have in your RHEL5 servers?
>>>
>>> Yes, I have this issue. It was introduced by the commit 20cd49738781b ("core:
>>> add support for multiple br2-external trees").
>>
>>  Would any of you RHEL5 users be able to contribute an autobuilder instance so
>> this kind of issue can be detected on time?
>
> I sent the e-mail as a heads up to the real users of RHEL5.
> From past e-mails, I know Thomas DS and Max are (or were) users.
>

True, I still need to support some RHEL5 machines, although the
majority is at RHEL6 and RHEL7 (or CentOS equivalents).
We are not using BR2_EXTERNAL though, so if I could get around it by
making sure the script is not actually called, I would be fine.

So strictly speaking for my own needs, I wouldn't really mind requiring bash 4.
(but please don't start using bash 4 features in other,
non-br2-external scripts just yet :-) )

Best regards,
Thomas
