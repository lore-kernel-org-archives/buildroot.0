From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 14 Aug 2014 11:57:52 +0200
Subject: [Buildroot] [PATCH] qt: don't install translation files by
	default
In-Reply-To: <CANxTyt5VK1XKYXe8Y3RbqDAoraWC_heS0p0HoCExfH3pbEbORA@mail.gmail.com>
References: <1407961570-10684-1-git-send-email-luca@lucaceresoli.net>
 <CANxTyt5VK1XKYXe8Y3RbqDAoraWC_heS0p0HoCExfH3pbEbORA@mail.gmail.com>
Message-ID: <53EC8820.6050202@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi,

thanks for reviewing this patch.

Danomi Manchego wrote:
> On Wed, Aug 13, 2014 at 4:26 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e (2013.11) introduced
>> the installation of the binary .qm translation files, unconditionally.
>>
>> However, the installed size is very large for some embedded systems
>> (about 8 MB), and they are not needed in many cases.
>>
>> In order to avoid such a waste of storage space, commit
>> 2ff329412f490dc916bab3377073ef5950a46298 (2014.08) made this
>> installation an option that could be disabled. For backward
>> compatibility, the option defaults to yes.
>>
>> Given the relevant size of these files, and that they had never been
>
> Nitpick: "relevant"?  Do you mean "relative" or "relatively large"?

Ah, yes, that makes no sense. I just meant "large", but the sentence
would be fixed even by simply removing that word: s/ relevant//.

I'll wait a little more for any comments, then resend.

-- 
Luca
