From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 16:35:26 +0100
Subject: [Buildroot] : How to add a path to environment variable ?
In-Reply-To: <CAGshWo3aGOKS6qqa8gg6i66z17vZDKeYQG-JE6VHF4LKfwvZHQ@mail.gmail.com>
 (manu f.'s message of "Fri, 22 Jan 2021 12:22:51 +0100")
References: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
 <20210121174729.31850f5c@windsurf.home>
 <CAGshWo2KMW3VvWSGeOvqqhvi3z-Onn_hdyA-4Yjb=YEKdUDuTw@mail.gmail.com>
 <20210121204741.08247783@windsurf.home> <20210121214338.GD2375@scaer>
 <87mtx18cze.fsf@dell.be.48ers.dk>
 <CAGshWo3aGOKS6qqa8gg6i66z17vZDKeYQG-JE6VHF4LKfwvZHQ@mail.gmail.com>
Message-ID: <87a6t17znl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "manu" == manu f <e.fiancette@gmail.com> writes:

 > Thanks all for your return,
 > ok, so I think I mistaken about buildroot nodejs version, sorry I used
 > "deprecated" term ;-)
 > I actualy use node version 14.15.0, but 12.x must work also.
 > I use the buildroot checkout version 2020.02.8 who must be if I well
 > understood at time I did it, the last stable version.
 > if I select the target package nodejs, in help, I saw it is based on V8.

V8 is a reference to the V8 Javascript engine used by nodejs (and
Chrome):

https://v8.dev/

Buildroot 2020.02.8 provides nodejs 12.18.4 (2020.02.9 bumped that to
nodejs 12.19.1 and the upcoming 2020.02.10 release will include 12.20.1
to fix some security issues).

 > if I need to update to a newer version I think I need to install my own
 > nodejs package version, right ? (or is there a way to update the installed
 > package inside buildroot without moving to another buidrood version ?

Correct, but if you do so, it would be nice if you could send a patch to
change the version so the upcoming 2021.02 release will have then new
version.

-- 
Bye, Peter Korsgaard
