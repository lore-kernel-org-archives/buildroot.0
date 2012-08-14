From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 09:50:23 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM configuration files in the
	fs skeleton
In-Reply-To: <20120814154110.4a74a4e1@skate>
References: <1344911089-31197-1-git-send-email-golubovsky@gmail.com>
 <1344911089-31197-2-git-send-email-golubovsky@gmail.com>
 <20120814154110.4a74a4e1@skate>
Message-ID: <CADiAo4JTEc_MpN9Tf96k6eeEK3wHaH5dFyVL-9QjhqBcqYjctw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 14, 2012 at 9:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> The PAM configuration file for busybox login allows local authentication
>> with blank passwords thus emulating the non-PAM login configuration.

>
> I'm not sure we want these in the default fs skeleton. Shouldn't the
> linux-pam package install these instead?
>

Well, I thought that such files (just like /etc/passwd) could be made static.

I can change this to make them installed by linux-pam itself.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
