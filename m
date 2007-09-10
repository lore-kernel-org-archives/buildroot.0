From: Roderick Taylor <myopiate@gmail.com>
Date: Tue, 11 Sep 2007 07:42:31 +1000
Subject: [Buildroot] Multiprojects
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1093F12CE@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE1093F12CE@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <e83232070709101442s7949bf86q834ca4488eb08e17@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/2007, Darcy Watkins <DWatkins@tranzeo.com> wrote:
> Hello,
>
> Newbie question here...
>
> To support multiple projects, I can change the project name using
> menuconfig and save the updated .config.
>
> If I save them as proj1.config, proj2.config, etc. is there a command
> line option or variable name I can set when invoking make to tell it to
> choose the correct project's file?
>
> ...or do I just have to load up the file into menuconfig and save it as
> .config and then run make for each case?
>

when you want to build proj1 copy proj1.config as .config in the
buildroot directory.
invoke "make oldconfig" and then "make".  And that will build with
proj1 configuration.
