From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 16 Dec 2013 10:55:40 -0200
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
Message-ID: <CAExDhvYZTKMaCvrFULU1EkV+RV+BKsvqP7hKJj4_WRwYnUYqwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Dec 14, 2013 at 9:52 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>>
>> [PATCHv3] QtSerialPort: new package
>> Thiago Correa <thiago.correa@gmail.com>
>> http://patchwork.ozlabs.org/patch/195057
>

I'm currently using this. Since then Qt5 has been integrated into
buildroot and it includes this module. The difference (other than git
hash) is that this patch compiles it for Qt4. We could drop assume
code using QSerialPort will all be Qt5 or be ported to Qt5 eventually.
