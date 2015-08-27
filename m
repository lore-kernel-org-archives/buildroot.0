From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 27 Aug 2015 21:03:55 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
In-Reply-To: <55DF074B.7080408@jcz.nl>
References: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
 <20150826154534.3e67c9bc@free-electrons.com>
 <CA+sos7-LVKNjkVc+1hg0w8WZMGEtnthaJnaA7-fUKEOizjJCeg@mail.gmail.com>
 <55DEC67C.6000500@wsystem.com> <20150827105450.100164af@free-electrons.com>
 <55DED48F.3030102@wsystem.com> <55DF074B.7080408@jcz.nl>
Message-ID: <CA+sos7_skmvhCRNMOf8d=sEYrc_cr=kLV0d7a76yKYX0Ma8=dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On Thu, Aug 27, 2015 at 2:49 PM, Jaap Crezee <jaap@jcz.nl> wrote:
> On 08/27/15 11:12, Beno?t Th?baudeau wrote:
>> OK, but in the meantime, until we have a wrapper for the internal toolchain too,
>> what do you want to do to fix the current build failure?
>>  - Forbid the use of ccache with Qt 5?
>
> I would not recommend that. Qt5base is *huge* and recompiling it over and over again (as I
> do when I am developing with/against buildroot) is just too time consuming.

Agreed.

>>  - Use the current patch?
>
> You can also look at one of my previous patches (see list archive). I simply don't have
> the time to respond to all correction requests unfortunately.

I have added your suggestion here:
https://bugreports.qt.io/browse/QTBUG-47951?focusedCommentId=291119&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-291119

Best regards,
Beno?t
