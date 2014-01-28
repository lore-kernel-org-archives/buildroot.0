From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
Date: Tue, 28 Jan 2014 11:18:06 +0100
Subject: [Buildroot] Post build script issue
In-Reply-To: <52E60287.7020305@mind.be>
References: <CAHKzcEOSork9JxSZWsef6m1wmPrZ2z1jEQqaig=LFkysgzqvNg@mail.gmail.com>
 <52E60287.7020305@mind.be>
Message-ID: <CAHKzcEOqAXbwMAkkAvH=H6DD2qBq2fQgQ4UX3bELabrFfJLd3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 27 January 2014 07:53, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>  ./$(s) is a bad idea since it will break the case when the script is an absolute path. But maybe $(abspath $(s)) works?
>

Right it will brake full path case. Anyway abspath works seamlessly
with full and relative paths, so sending a patch.

Thanks,
/Waldek
