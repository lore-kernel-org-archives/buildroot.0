From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 21:42:01 +0200
Subject: [Buildroot] Upgrading Erlang and ejabberd
In-Reply-To: <CAJtjsKZU5FzxA9gidh0ZVoiQVdag6YEbWH75iDQ3XCmQ+KBC-Q@mail.gmail.com>
References: <CA+-urNQWNUXKHZdjvkcijZYW0OQJr3DMtgQNZmhThC-TssdnNw@mail.gmail.com>
 <8760hano0p.fsf@dell.be.48ers.dk>
 <l449udxe78.ln2@ID-313208.user.individual.net>
 <CAJtjsKZU5FzxA9gidh0ZVoiQVdag6YEbWH75iDQ3XCmQ+KBC-Q@mail.gmail.com>
Message-ID: <20170509214201.7772feeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 May 2017 18:37:27 +0200, Johan Oudinet wrote:

> I won't have time to work on updating ejabberd this week but I can have a
> look next week.
> Feel free to upgrade erlang in the meantime even if it breaks ejabberd.

Anyway the "master" branch is closed to version bumps, so new version
bumps will go in the "next" branch. We can therefore take the erlang
bump, and merge later the ejabberd bump.

Or perhaps, we will not even have merged the erlang bump by the time
your work on bumping ejabberd.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
